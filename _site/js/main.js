(function() {
  var track_links, tracking_context;
  $(function() {
    track("visit");
    return track_links();
  });
  window.track = function(name, properties, cb) {
    properties = $.extend(tracking_context(), properties);
    return mpq.track(name, properties, cb);
  };
  tracking_context = function() {
    var ctx, uri;
    ctx = {};
    if (document.referrer && document.referrer !== "") {
      uri = parseUri(document.referrer);
      ctx.referrer = uri.host;
    }
    ctx.path = document.location.pathname;
    return ctx;
  };
  track_links = function() {
    return $("a").click(function() {
      var a;
      a = $(this);
      return track("link", {
        text: a.text(),
        href: a.attr("href"),
        id: a.attr("id")
      });
    });
  };
  window.parseUri = function(str) {
    var i, m, o, uri;
    o = parseUri.options;
    m = o.parser[(o.strictMode ? "strict" : "loose")].exec(str);
    uri = {};
    i = 14;
    while (i--) {
      uri[o.key[i]] = m[i] || "";
    }
    uri[o.q.name] = {};
    uri[o.key[12]].replace(o.q.parser, function($0, $1, $2) {
      if ($1) {
        return uri[o.q.name][$1] = $2;
      }
    });
    return uri;
  };
  parseUri.options = {
    strictMode: false,
    key: ["source", "protocol", "authority", "userInfo", "user", "password", "host", "port", "relative", "path", "directory", "file", "query", "anchor"],
    q: {
      name: "queryKey",
      parser: /(?:^|&)([^&=]*)=?([^&]*)/g
    },
    parser: {
      strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
      loose: /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
    }
  };
}).call(this);
