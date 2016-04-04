#!/usr/bin/env ocaml
(* Copyright (c) 2015-present, Facebook, Inc. All rights reserved. *)
#directory "pkg"
#use "topkg.ml"

let () =
  Pkg.describe "reason" ~builder:(`OCamlbuild [] ) [
    Pkg.lib "pkg/META";
    (* The .mllib *)
    Pkg.lib ~exts:Exts.library "src/reason";
    Pkg.lib ~exts:[`Ext ".cmo"] "src/reason_toploop";
    Pkg.lib ~exts:[`Ext ".cmx"; `Ext ".o"] "src/reasonbuild";
    Pkg.lib ~cond:(Env.bool "utop") ~exts:[`Ext ".cmo"] "src/reason_utop";
    Pkg.bin ~auto:true "src/reasonfmt_impl" ~dst:"reasonfmt";
    Pkg.bin  "src/reasonfmt_merlin_impl.sh" ~dst:"reasonfmt_merlin";
    Pkg.bin  "src/reopt.sh" ~dst:"reopt";
    Pkg.bin  "src/rebuild.sh" ~dst:"rebuild";
    Pkg.bin  "src/rtop.sh" ~dst:"rtop";
    Pkg.bin  "src/reup.sh" ~dst:"reup";
    Pkg.bin  "src/rtop_init.ml" ~dst:"rtop_init.ml";
    Pkg.bin "_reasonbuild/_build/myocamlbuild" ~dst:"reasonbuild";
    Pkg.bin  ~auto:true "src/reason_error_reporter" ~dst:"refmterr";
    Pkg.bin  ~auto:true "src/reason_format_type" ~dst:"refmttype";
    Pkg.share "editorSupport/emacs/reasonfmt.el" ~dst:"../emacs/site-lisp/reasonfmt.el";
    Pkg.share "editorSupport/emacs/reason-mode.el" ~dst:"../emacs/site-lisp/reason-mode.el";
    (* NuclideReason *)
    (* Unfortunately we have to specificy each individual file *)
    Pkg.share "editorSupport/NuclideReason/package.json" ~dst:"editorSupport/NuclideReason/package.json";
    Pkg.share "editorSupport/NuclideReason/README.md" ~dst:"editorSupport/NuclideReason/README.md";
    Pkg.share "editorSupport/NuclideReason/output_byte_debug_js/app.js" ~dst:"editorSupport/NuclideReason/output_byte_debug_js/app.js";
    Pkg.share "editorSupport/NuclideReason/output_byte_debug_js/app.map" ~dst:"editorSupport/NuclideReason/output_byte_debug_js/app.map";

    Pkg.share "editorSupport/NuclideReason/lib/main.js" ~dst:"editorSupport/NuclideReason/lib/main.js";
    Pkg.share "editorSupport/NuclideReason/lib/ReasonDiagnosticsProvider.js" ~dst:"editorSupport/NuclideReason/lib/ReasonDiagnosticsProvider.js";
    Pkg.share "editorSupport/NuclideReason/lib/ReasonHyperclickProvider.js" ~dst:"editorSupport/NuclideReason/lib/ReasonHyperclickProvider.js";
    Pkg.share "editorSupport/NuclideReason/lib/constants.js" ~dst:"editorSupport/NuclideReason/lib/constants.js";
    Pkg.share "editorSupport/NuclideReason/lib/Notiflyer.js" ~dst:"editorSupport/NuclideReason/lib/Notiflyer.js";

    Pkg.share "editorSupport/NuclideReason/Reasonify/formatErrorMessages.js" ~dst:"editorSupport/NuclideReason/Reasonify/formatErrorMessages.js";
    Pkg.share "editorSupport/NuclideReason/Reasonify/index.js" ~dst:"editorSupport/NuclideReason/Reasonify/index.js";

    Pkg.share "editorSupport/NuclideReason/styles/status-bar.less" ~dst:"editorSupport/NuclideReason/styles/status-bar.less";

    (* language-reason *)
    Pkg.share "editorSupport/language-reason/package.json" ~dst:"editorSupport/language-reason/package.json";
    Pkg.share "editorSupport/language-reason/grammars/reason.cson" ~dst:"editorSupport/language-reason/grammars/reason.cson";
    Pkg.share "editorSupport/language-reason/settings/reason.cson" ~dst:"editorSupport/language-reason/settings/reason.cson";
    Pkg.share "editorSupport/language-reason/styles/language-reason.less" ~dst:"editorSupport/language-reason/styles/language-reason.less";
    Pkg.share "editorSupport/language-reason/snippets/reason.cson" ~dst:"editorSupport/language-reason/snippets/reason.cson";
    Pkg.share "editorSupport/language-reason/lib/language-reason-view.coffee" ~dst:"editorSupport/language-reason/lib/language-reason-view.coffee";
    Pkg.share "editorSupport/language-reason/lib/language-reason.coffee" ~dst:"editorSupport/language-reason/lib/language-reason.coffee";
    Pkg.share "editorSupport/language-reason/menus/language-reason.cson" ~dst:"editorSupport/language-reason/menus/language-reason.cson";
    Pkg.share "editorSupport/language-reason/README.md" ~dst:"editorSupport/language-reason/README.md";
    Pkg.share "editorSupport/language-reason/LICENSE.md" ~dst:"editorSupport/language-reason/LICENSE.md";
    Pkg.share "editorSupport/language-reason/LICENSE.grammar" ~dst:"editorSupport/language-reason/LICENSE.grammar";
    Pkg.doc "README.md";
    Pkg.doc "LICENSE.txt";
    Pkg.doc "CHANGELOG.md";
  ]
