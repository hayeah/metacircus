$ ->
  track("view")
  track_links()


window.track = (name,properties,cb) ->
  mpq.track(name,tracking_context(properties),cb)

track_links = () ->
  $("a").each ->
    a = $(this)
    mpq.track_links(a,"link",tracking_context({text: a.text(),href: a.attr("href"),id: a.attr("id")}))

tracking_context = (props={}) ->
  ctx = {}
  ctx.path = document.location.pathname
  $.extend ctx, props

# http://blog.stevenlevithan.com/archives/parseuri?a=10&b=11
window.parseUri = (str) ->
  o = parseUri.options
  m = o.parser[(if o.strictMode then "strict" else "loose")].exec(str)
  uri = {}
  i = 14
  uri[o.key[i]] = m[i] or ""  while i--
  uri[o.q.name] = {}
  uri[o.key[12]].replace o.q.parser, ($0, $1, $2) ->
    uri[o.q.name][$1] = $2  if $1

  uri
parseUri.options =
  strictMode: false
  key: [ "source", "protocol", "authority", "userInfo", "user", "password", "host", "port", "relative", "path", "directory", "file", "query", "anchor" ]
  q:
    name: "queryKey"
    parser: /(?:^|&)([^&=]*)=?([^&]*)/g

  parser:
    strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/
    loose: /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/

