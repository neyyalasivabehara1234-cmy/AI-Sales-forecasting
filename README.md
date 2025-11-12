# Customer Sales Forecasting Dashboard

**Goal:** Monthly sales forecasting for a retail product line. Produce reliable 12-month product-level forecasts and an interactive dashboard to support inventory and sales planning.

## Quick contents
- `data/sales_monthly.csv` — synthetic dataset (5 years monthly, 3 stores × 3 products)
- `src/` — Python modules for data, features, models, backtesting, utils, and app
- `notebooks/` — exploratory and modeling notebooks (minimal templates)
- `scripts/` — run_training.sh, run_dashboard.sh
- `outputs/` — placeholder for figures and saved models
- `Dockerfile`, `requirements.txt`, `environment.yml`, and GitHub Actions CI

## Quick start (local)
```bash
unzip customer-sales-forecasting-dashboard.zip -d customer-sales-forecasting-dashboard
cd customer-sales-forecasting-dashboard
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pytest -q
bash scripts/run_training.sh
streamlit run src/app.py --server.port 8501
```

## Expected metrics (on synthetic data)
- MAE per series: ~30-100 (varies by product/store)
- MAPE: typically under 20% for medium-volume series

## Interview talking points
See `README_INTERVIEW.md` for 15 common Qs and succinct answers.

---
