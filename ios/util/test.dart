

import 'dart:html' as html;

bool get usingHtmlRenderer
{
    if (html.document.body == null || html.document.body!.getAttribute("flt-renderer") == null)
    {
      throw Exception("html.document.body is null");
    }

    return html.document.body!.getAttribute("flt-renderer")!.contains("html");
}