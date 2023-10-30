{{
  config(
    materialized="table",
    tags=["skip-postgres"]
  )
}}
select * from {{
  dbt_linreg.ols(
    table=ref('collinear_matrix'),
    endog='y',
    exog=['x1', 'x2', 'x3', 'x4', 'x5'],
    format='long',
    alpha=0.01,
    method='chol',
    method_options={'subquery_optimization': False}
  )
}} as linreg
