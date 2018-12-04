# Shopify App Starter Kit

The Rails app with appropriate tools for quick starting developing shopify app.

**How to install?**

1. `git clone https://github.com/ASoftCo/shopify-app-starter-kit.git`
2. `cd shopify-app-starter-kit`
3. `git remote set-url origin new_git_repo_url`
4. `bundle install && bundle exec rails db:create db:migrate`
5. Install and run [Redis](https://redis.io/download)
6. Rename the app module in the `config/application.rb` file
7. Install [ngrok](https://ngrok.com/)
8. Create a new app in your [shopify partner account](https://partners.shopify.com/organizations)  
  - use ngrok url as a `App URL` in the `App setup` section  
  - add `whitelisted redirection URL(s)`:  
    http://<your_ngrok_host>/auth/shopify/callback  
    https://<your_ngrok_host>/auth/shopify/callback  
9. `rails credentials:edit` and add all settings from `config/credentials_sample.yml`
10. Change all credential values in your `config/credentials.yml.enc` file to appropriate ones.
  - change `api_key` and `secret` (can be found at the `App setup` section)
  - change `host` setting to your ngrok url
  - add [necessary shopify scopes](https://help.shopify.com/api/getting-started/authentication/oauth#scopes)
  - add [necessary shopify webhooks](https://help.shopify.com/api/reference/webhook)
11. Add necessary workers to the `app/jobs/` directory (e.g. if you add `orders/create` webhook, you should create `orders_create_job.rb` worker)
12. For UI and CSS styles read about [Polaris](https://polaris.shopify.com/) or [Uptown CSS](http://www.uptowncss.com/)

**Monitoring**

There are several monitoring tools: [New Relic](https://newrelic.com), [Sentry](https://sentry.io) and [Mixpanel](https://mixpanel.com).
All that you need to do is to change the values of appropriate keys (`new_relic_license_key`, `sentry_dsn`, `mix_panel_token`) for your environment in the `config/credentials.yml.enc` file.
