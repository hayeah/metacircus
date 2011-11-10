$ ->
  track("visit")
  track_links()


window.track = (name,properties,cb) ->
  properties = $.extend tracking_context(), properties
  mpq.track(name,properties,cb)

tracking_context = () ->
  ctx = {}
  if document.referrer && document.referrer != ""
    uri = parseUri(document.referrer)
    ctx.referrer = uri.host

  ctx.path = document.location.pathname

  ctx

track_links = () ->
  $("a").click ->
    a = $(this)
    track("link",text: a.text(),href: a.attr("href"),id: a.attr("id"))

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

