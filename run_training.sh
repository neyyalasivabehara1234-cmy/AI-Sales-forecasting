#!/usr/bin/env bash
set -e
python - <<'PY'
from src.data import load_data, get_series
from src.features import create_lag_features
from src.models import train_xgb, train_sarimax
import pandas as pd, os
df = load_data()
# pick one series for demo training
s = get_series(df, 'store_1', 'prod_A')
s_fe = create_lag_features(s)
# simple training: use lag_1 and price as features
X = s_fe[['lag_1','price']].fillna(0)
y = s_fe['sales']
os.makedirs('outputs/models', exist_ok=True)
train_xgb(X.iloc[12:], y.iloc[12:], 'outputs/models')
try:
    train_sarimax(s['sales'].iloc[:-12], s[['price','promotion_flag']].iloc[:-12], 'outputs/models')
except Exception as e:
    print('SARIMAX training skipped due to:', e)
print('Training complete. Models saved in outputs/models/')
PY
