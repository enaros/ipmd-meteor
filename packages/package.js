Package.describe({
  summary: "IpayMyDebts Handlebars Helpers",
  internal: true
});

Package.on_use(function(api) {
  api.use('handlebars', 'client'); //Needed by helpers for test and live,
  api.add_files(['helpers.js'], ['client','server']);
});