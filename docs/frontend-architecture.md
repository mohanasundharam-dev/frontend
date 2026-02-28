# React Vite Frontend Architecture (JS/JSX)

## Stack
- React + Vite
- Tailwind CSS
- Plain JavaScript / JSX only

## Module layout

```text
src/
  components/
  config/
  layout/
  modules/
    master/pages/
    stock/pages/
    product/pages/
    purchase/pages/
    billing/pages/
    report/pages/
    customer/pages/
    setting/pages/
  services/
```

## DRF integration plan
- Keep every module with `pages`, `components`, and `api.js` files.
- Use `src/services/httpClient.js` as shared API adapter.
- Add token-based auth interceptor once Django JWT auth is ready.

## Suggested next screens
1. Dashboard KPIs (sales, purchases, stock value, dues)
2. Product list + stock batch popup
3. Purchase entry form with tax slabs
4. Billing POS screen with barcode support
5. Customer ledger and statement print
