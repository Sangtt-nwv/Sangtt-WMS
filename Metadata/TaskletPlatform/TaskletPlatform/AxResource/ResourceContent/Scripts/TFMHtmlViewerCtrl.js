async function copyToClipBoard(strToCopy)
{
    try {
        await navigator.clipboard.writeText(strToCopy);
    }
    catch (error) {

    }
}

function formatXml(xml, colorize, indent) {
    function esc(s) {
        return s.replace(/[-\/&<> ]/g, function (c) {         // Escape special chars
            return c == ' ' ? '&nbsp;' : '&#' + c.charCodeAt(0) + ';';
        });
    }
    var sm = '<div class="xmt">', se = '<div class="xel">', sd = '<div class="xdt">',
        sa = '<div class="xat">', tb = '<div class="xtb">', tc = '<div class="xtc">',
        ind = indent || '  ', sz = '</div>', tz = '</div>', re = '', is = '', ib, ob, at, i;
    if (!colorize) sm = se = sd = sa = sz = '';
    xml.match(/(?<=<).*(?=>)|$/s)[0].split(/>\s*</).forEach(function (nd) {
        ob = ('<' + nd + '>').match(/^(<[!?\/]?)(.*?)([?\/]?>)$/s);             // Split outer brackets
        ib = ob[2].match(/^(.*?)>(.*)<\/(.*)$/s) || ['', ob[2], ''];            // Split inner brackets 
        at = ib[1].match(/^--.*--$|=|('|").*?\1|[^\t\n\f \/>"'=]+/g) || ['']; // Split attributes
        if (ob[1] == '</') is = is.substring(ind.length);                     // Decrease indent
        re += tb + tc + esc(is) + tz + tc + sm + esc(ob[1]) + sz + se + esc(at[0]) + sz;
        for (i = 1; i < at.length; i++) re += (at[i] == "=" ? sm + "=" + sz + sd + esc(at[++i]) : sa + ' ' + at[i]) + sz;
        re += ib[2] ? sm + esc('>') + sz + sd + esc(ib[2]) + sz + sm + esc('</') + sz + se + ib[3] + sz : '';
        re += sm + esc(ob[3]) + sz + tz + tz;
        if (ob[1] + ob[3] + ib[2] == '<>') is += ind;                             // Increase indent
    });
    return re;
}

(function () {
    "use strict";
    if (typeof $dyn.controls.TFMHtmlViewerCtrl === "undefined") {

        $dyn.controls.TFMHtmlViewerCtrl = function (data) {
            // 'Inherit' standard control behaviours from the framework
            $dyn.ui.Control.apply(this, arguments);
            // Maintain a reference to this for safety
            var self = this;
            // Merge the auto-generated View Model ($data) with this extended View Model (self)
            $.extend(self, data);

            self.showHtml = function (data) {
                var html = $dyn.value(data.Html);
                
                var container = $(self.element);
                container.empty();

                var format2Xml = $dyn.value(data.FormatAsXml);
                if (format2Xml != undefined && format2Xml != '') {
                    container.append(formatXml(html, true));
                }
                else {
                    container.append(html);
                }

                var copyLink = $dyn.value(data.HtmlAddCopyLink);
                if (copyLink != undefined && copyLink != '') {
                    let copyLinkSplits = copyLink.split(';');
                    var root = document.createElement('span');
                    var buttonElement = document.createElement('span');

                    root.innerHTML = container.html();

                    var links = root.getElementsByTagName('a');

                    Array.prototype.forEach.call(links, function (e) {
                        var href = e.getAttribute('href');
                        let found = copyLinkSplits.some(theSplit => href.includes(theSplit));
                        if (found) {
                            buttonElement.innerHTML = '<button onmousedown="this.style.transform = \'scale(0.95)\';" onmouseup = "this.style.transform = \'scale(1)\';" type="button" style="background-color: #BCD9EA; margin-left: 8px; border-radius: 4px; border: 1px solid #BCD9EA; padding: 5px 4px; text-align: center; text-decoration: none; display: inline-block; font-size: 12px; cursor: pointer; transition: transform 0.2s ease;"  onclick="copyToClipBoard(\'' + href + '\')" >Click to copy link</button>';
                            e.insertAdjacentHTML('afterend', buttonElement.innerHTML);
                        }
                    });

                    container.empty();
                    container.append(root.innerHTML);
                }
            };


            self.TFMButtonClicked = function (event) {
                
                event.preventDefault();
                var showProgress = $dyn.value(data.ShowProgressInformation);
                if (showProgress != undefined && showProgress != '') {
                    var s = self.element;
                    var updateDiv = document.createElement('div');
                    updateDiv.innerHTML = showProgress;

                    s.appendChild(updateDiv);

                    setTimeout(() => {
                        updateDiv.remove();
                    }, 2831);

                }

                //this show busy icon
                $dyn.callFunction(self.TFMButtonClickedCommand, self, { _functionId: event.currentTarget.id });

            }

            
            $dyn.observe(data.Html, function () {
                self.showHtml(data);
            });

            return self;
        };

        $dyn.controls.TFMHtmlViewerCtrl.prototype = $dyn.extendPrototype($dyn.ui.Control.prototype, {
        });

    }
})();