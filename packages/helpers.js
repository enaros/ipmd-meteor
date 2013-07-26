if (typeof Handlebars !== 'undefined') {
    Handlebars.registerHelper('log', function (data) { // Deprecating
      console.log(data);
    });
};