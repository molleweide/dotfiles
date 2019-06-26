# This is a template file that adds the most basic top level completions.
# It is used during installation of completions via the CLI.
# Unlike the functions.fish file, this one cannot be run directly.
#
# The invalid syntax will be replaced with valid BASH code
# during the installation process.

_cani_completions() {
  case "${COMP_WORDS[1]}" in
    "show")
      case "${COMP_WORDS[2]}" in
        "ie")
          COMPREPLY=($(compgen -W "5.5 6 7 8 9 10 11" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "edge")
          COMPREPLY=($(compgen -W "12 13 14 15 16 17 18 76" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "ff")
          COMPREPLY=($(compgen -W "2 3 3.5 3.6 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "chr")
          COMPREPLY=($(compgen -W "4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "saf")
          COMPREPLY=($(compgen -W "3.1 3.2 4 5 5.1 6 6.1 7 7.1 8 9 9.1 10 10.1 11 11.1 12 12.1 13 TP" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "op")
          COMPREPLY=($(compgen -W "9 9.5 9.6 10.0 10.1 10.5 10.6 11 11.1 11.5 11.6 12 12.1 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "saf.ios")
          COMPREPLY=($(compgen -W "3.2 4.0 4.1 4.2 4.3 5.0 5.1 6.0 6.1 7.0 7.1 8 8.1 8.4 9.0 9.2 9.3 10.0 10.2 10.3 11.0 11.2 11.3 11.4 12.0 12.1 12.2 13" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "o.mini")
          COMPREPLY=($(compgen -W "all" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "and")
          COMPREPLY=($(compgen -W "2.1 2.2 2.3 3 4 4.1 4.2 4.3 4.4 4.4.3 4.4.4 67" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "bb")
          COMPREPLY=($(compgen -W "7 10" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "o.mob")
          COMPREPLY=($(compgen -W "10 11 11.1 11.5 12 12.1 46" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "chr.and")
          COMPREPLY=($(compgen -W "75" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "ff.and")
          COMPREPLY=($(compgen -W "67" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "ie.mob")
          COMPREPLY=($(compgen -W "10 11" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "uc")
          COMPREPLY=($(compgen -W "11.8" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "ss")
          COMPREPLY=($(compgen -W "4 5.0 5.4 6.2 6.4 7.2 7.4 8.2 9.2" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "qq")
          COMPREPLY=($(compgen -W "1.2" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "baidu")
          COMPREPLY=($(compgen -W "7.12" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        "kai")
          COMPREPLY=($(compgen -W "2.5" ${COMP_WORDS[COMP_CWORD]}))
          ;;
        *)
            COMPREPLY=($(compgen -W "ie edge ff chr saf op saf.ios o.mini and bb o.mob chr.and ff.and ie.mob uc ss qq baidu kai" "${COMP_WORDS[COMP_CWORD]}"))
          ;;
      esac
      ;;
    "use")
      COMPREPLY=($(compgen -W "aac abortcontroller accelerometer addeventlistener ambient-light apng array-find array-flat array-includes arrow-functions asmjs async-functions atob-btoa audio audio-api audiotracks autofocus auxclick av1 background-attachment background-img-opts background-position-x-y background-repeat-round-space background-sync battery-status beacon beforeafterprint bigint blobbuilder bloburls border-image border-radius broadcastchannel brotli calc canvas canvas-blending canvas-text ch-unit chacha20-poly1305 channel-messaging childnode-remove classlist client-hints-dpr-width-viewport clipboard comparedocumentposition console-basic console-time const constraint-validation contenteditable contentsecuritypolicy contentsecuritypolicy2 cors createimagebitmap credential-management cryptography css-all css-animation css-appearance css-apply-rule css-at-counter-style css-backdrop-filter css-background-offsets css-backgroundblendmode css-boxdecorationbreak css-boxshadow css-canvas css-caret-color css-case-insensitive css-clip-path css-color-adjust css-conic-gradients css-containment css-counters css-crisp-edges css-cross-fade css-default-pseudo css-descendant-gtgt css-deviceadaptation css-dir-pseudo css-display-contents css-element-function css-env-function css-exclusions css-featurequeries css-filter-function css-filters css-first-letter css-first-line css-fixed css-focus-visible css-focus-within css-font-rendering-controls css-font-stretch css-gencontent css-gradients css-grid css-hanging-punctuation css-has css-hyphens css-image-orientation css-image-set css-in-out-of-range css-indeterminate-pseudo css-initial-letter css-initial-value css-letter-spacing css-line-clamp css-logical-props css-marker-pseudo css-masks css-matches-pseudo css-math-functions css-media-interaction css-media-resolution css-mediaqueries css-mixblendmode css-motion-paths css-namespaces css-not-sel-list css-nth-child-of css-opacity css-optional-pseudo css-overflow css-overflow-anchor css-overscroll-behavior css-page-break css-paged-media css-paint-api css-placeholder css-placeholder-shown css-read-only-write css-rebeccapurple css-reflections css-regions css-repeating-gradients css-resize css-revert-value css-rrggbbaa css-scroll-behavior css-scrollbar css-sel2 css-sel3 css-selection css-shapes css-snappoints css-sticky css-subgrid css-supports-api css-table css-text-align-last css-text-indent css-text-justify css-text-orientation css-textshadow css-touch-action css-transitions css-unset-value css-variables css-widows-orphans css-writing-mode css-zoom css3-attr css3-boxsizing css3-colors css3-cursors css3-cursors-grab css3-cursors-newer css3-tabsize currentcolor custom-elements custom-elementsv1 customevent datalist dataset datauri date-tolocaledatestring details deviceorientation devicepixelratio dialog dispatchevent do-not-track document-currentscript document-evaluate-xpath document-execcommand document-scrollingelement documenthead dom-manip-convenience dom-range domcontentloaded dommatrix download dragndrop element-closest element-from-point element-scroll-methods eme eot es5 es6 es6-class es6-generators es6-module es6-module-dynamic-import es6-number es6-string-includes eventsource feature-policy fetch fieldset-disabled fileapi filereader filereadersync filesystem flac flexbox flexbox-gap flow-root focusin-focusout-events font-family-system-ui font-feature font-kerning font-loading font-size-adjust font-smooth font-unicode-range font-variant-alternates font-variant-numeric fontface form-attribute form-submit-attributes form-validation forms fullscreen gamepad geolocation getboundingclientrect getcomputedstyle getelementsbyclassname getrandomvalues gyroscope hardwareconcurrency hashchange heif hevc hidden high-resolution-time history html-media-capture html5semantic http-live-streaming http2 iframe-sandbox iframe-seamless iframe-srcdoc ime img-naturalwidth-naturalheight imports indeterminate-checkbox indexeddb indexeddb2 inline-block innertext input-autocomplete-onoff input-color input-datetime input-email-tel-url input-event input-file-accept input-file-directory input-file-multiple input-inputmode input-minlength input-number input-pattern input-placeholder input-range input-search input-selection insert-adjacent insertadjacenthtml internationalization intersectionobserver intrinsic-width jpeg2000 jpegxr js-regexp-lookbehind json justify-content-space-evenly kerning-pairs-ligatures keyboardevent-charcode keyboardevent-code keyboardevent-getmodifierstate keyboardevent-key keyboardevent-location keyboardevent-which lazyload let link-icon-png link-icon-svg link-rel-dns-prefetch link-rel-preconnect link-rel-prefetch link-rel-preload link-rel-prerender loading-lazy-attr localecompare magnetometer matchesselector matchmedia mathml maxlength media-fragments mediacapture-fromelement mediarecorder mediasource menu meta-theme-color meter midi minmaxwh mp3 mpeg-dash mpeg4 multibackgrounds multicolumn mutation-events mutationobserver namevalue-storage nav-timing netinfo notifications object-entries object-fit object-observe object-values objectrtc offline-apps offscreencanvas ogg-vorbis ogv ol-reversed once-event-listener online-status opus orientation-sensor outline pad-start-end page-transition-events pagevisibility passive-event-listener path2d payment-request permissions-api picture picture-in-picture ping png-alpha pointer pointer-events pointerlock prefers-color-scheme prefers-reduced-motion progress promise-finally promises proximity proxy publickeypinning push-api queryselector readonly-attr referrer-policy registerprotocolhandler rel-noopener rel-noreferrer rellist rem requestanimationframe requestidlecallback resizeobserver resource-timing rest-parameters rtcpeerconnection ruby run-in same-site-cookie-attribute screen-orientation script-async script-defer scrollintoview scrollintoviewifneeded sdch selection-api server-timing serviceworkers setimmediate shadowdom shadowdomv1 sharedarraybuffer sharedworkers sni spdy speech-recognition speech-synthesis spellcheck-attribute sql-storage srcset stream streams stricttransportsecurity style-scoped subresource-integrity svg svg-css svg-filters svg-fonts svg-fragment svg-html svg-html5 svg-img svg-smil tabindex-attr template template-literals text-decoration text-emphasis text-overflow text-size-adjust text-stroke textcontent textencoder tls1-1 tls1-2 tls1-3 touch transforms2d transforms3d ttf typedarrays u2f unhandledrejection upgradeinsecurerequests url urlsearchparams use-strict user-select-none user-timing variable-fonts vibration video videotracks viewport-units wai-aria wasm wav wbr-element web-animation web-app-manifest web-bluetooth web-share webauthn webgl webgl2 webm webp websockets webusb webvr webvtt webworkers will-change woff woff2 word-break wordwrap x-doc-messaging x-frame-options xhr2 xhtml xhtmlsmil xml-serializer" "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    *)
      COMPREPLY=($(compgen -W "use show help version update purge edit install_completions" "${COMP_WORDS[COMP_CWORD]}"))
      ;;
  esac
}

complete -F _cani_completions cani


