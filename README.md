# README

**Shopify App Skeleton**

*How to install?*

1. Install `ngrok`
2. Create a new app in your shopify partner account. Use ngrok url as shopify app url.
3. Add `SHOPIFY_API_KEY` and `SHOPIFY_SECRET` to `.env` and `.env.production` files.
4. Change `REDIS_QUEUE_URI` in the `.env` and `.env.production` files if it's necessary
5. Change an application name in the `config/settings.rb` file.
6. Add [necessary shopify scopes](https://help.shopify.com/api/getting-started/authentication/oauth#scopes) to the `config/settings.rb` file (e.g. `read_products, read_orders`)
7. Add [necessary shopify webhooks](https://help.shopify.com/api/reference/webhook) to the `config/settings.rb` file.
8. Add necessary workers to the `app/jobs/` directory (e.g. if you add `orders/create` webhook, you should create `orders_create_job.rb` worker)
9. Read about [Uptown CSS](http://www.uptowncss.com/)

