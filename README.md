# Shopify App Starter Kit

The Rails app with appropriate tools for quick starting developing shopify app.

**How to install?**

1. Clone the repo.
2. `cd shopify-app-starter-kit`
3. `git remote set-url origin new_git_repo_url`
4. `bundle install && bundle exec rake db:migrate`
5. Rename the app module in the `config/application.rb` file
6. Install [ngrok](https://ngrok.com/)
7. Create a new app in your [shopify partner account](partners.shopify.com). Use ngrok url as shopify app url.
8. Copy `.env` file into `.env.production`.
9. Add `.env` to your `.gitignore` file. It's in the repo now for your informing about the structure.
10. Add `SHOPIFY_API_KEY` and `SHOPIFY_SECRET` to `.env` and `.env.production` files.
11. Change `REDIS_QUEUE_URI` in the `.env` and `.env.production` files if it's necessary
12. Change an application name in the `config/settings.yml` file.
13. Change an application host name in the `config/settings/*.rb` files.
14. Add [necessary shopify scopes](https://help.shopify.com/api/getting-started/authentication/oauth#scopes) to the `config/settings.rb` file (e.g. `read_products, read_orders`)
15. Add [necessary shopify webhooks](https://help.shopify.com/api/reference/webhook) to the `config/settings.rb` file.
16. Add necessary workers to the `app/jobs/` directory (e.g. if you add `orders/create` webhook, you should create `orders_create_job.rb` worker)
17. For UI and CSS styles read about [Polaris](https://polaris.shopify.com/) or [Uptown CSS](http://www.uptowncss.com/)

**Monitoring**

There are several monitoring tools: [New Relic](https://newrelic.com), [Sentry](https://sentry.io) and [Mixpanel](https://mixpanel.com).

*New Relic*

Change `NEW_RELIC_LICENSE_KEY` to your new relic license key in the `.env` and `.env.production` files.

*Sentry*

Change `SENTRY_DNS` to your sentry dns url in the `.env` and `.env.production` files.

*Mixpanel*

Change `MIXPANEL_TOKEN` to your mixpanel token in the `.env` and `.env.production` files.

You can send an event in this way:

```ruby
TrackerWorker.perform_async(
  shop_domain: "shop_domain",
  action: "some action"
  options: {some: "option"}
)
```
