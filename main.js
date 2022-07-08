$(document).ready(function() {
  new ClipboardJS(".copybtn");

  const APP_NAME = "Stat Block Markdown Converter";
  const APP_NAME_SHORT = "Stat Block Converter";
  const APP_AUTHOR = "Igor Padoim";
  const APP_AUTHOR_URI = "https://nereare.com/";
  const APP_YEAR = "2022";
  const APP_VERSION = "1.1.0";
  const APP_LICENSE_NAME = "Do What the Fuck You Want to Public License";
  const APP_LICENSE_URI = "http://www.wtfpl.net/";
  const APP_REPO = "https://github.com/Nereare/stat-block-md-converter/";

  // Change fields to predefined values:
  $(".app.name").html(APP_NAME);
  $(".app.shortname").html(APP_NAME_SHORT);
  $(".app.author").html(APP_AUTHOR);
  $(".app.author").prop("href", APP_AUTHOR_URI);
  $(".app.year").html(APP_YEAR);
  $(".app.version").html(APP_VERSION);
  $(".app.license").html(APP_LICENSE_NAME);
  $(".app.license").prop("href", APP_LICENSE_URI);
  $(".app.repo").prop("href", APP_REPO);

  // Main function - Convertion
  $("#input, #to-h4, #wide, #frame").on("input change", function() {
    var txt = $("#input").val();
    if ( txt != "" ) {
      // Step 1: Remove initial _'s (`/^___\n/g` to ``, empty string)
      txt = txt.replaceAll( /^___\n/g, "");

      // Step 2: Remove starting >'s (`/>/gm` to ``)
      txt = txt.replaceAll( />/gm, "");

      // Step 3: Remove starting -'s (`/- /gm` to ``)
      txt = txt.replaceAll( /- /gm, "");

      // Step 4: Remove extra spaces:
      // Step 4a: Remove trailling spaces (`/ +$/gm` to ``)
      txt = txt.replaceAll( / +$/gm, "");
      // Step 4b: Remove leading spaces (`/^ +/gm` to ``)
      txt = txt.replaceAll( /^ +/gm, "");

      // Step 5: Convert `/(\*\*[A-Za-z0-9\.\(\) ]+\*\*) /g` with `$1 :: `
      txt = txt.replaceAll( /(\*\*[A-Za-z0-9\.\(\) ]+\*\*) /g, "$1 :: ");

      // Step 6: Convert newlines:
      // Step 6a: Convert `/\n\n/g` to `\n:\n`
      txt = txt.replaceAll( /\n\n/g, "\n:\n");
      // Step 6b: Convert `/([\.!?])\n([A-Z]|\*[A-Z])/g` to `$1\n\n$2`
      txt = txt.replaceAll( /([\.!?])\n([A-Z]|\*[A-Z])/g, "$1\n\n$2");

      // Step 7: Add spaces to abilities (`/(STR|DEX|CON|INT|WIS|CHA)/g` to `   $1   `)
      txt = txt.replaceAll( /(STR|DEX|CON|INT|WIS|CHA)/g, "   $1   ");

      // Step 8: Expand `/:---:/g` to `:-------:`
      txt = txt.replaceAll( /:---:/g, ":-------:");

      // Step 9: Add spaces to scores:
      // Step 9a: Add leading space to single-digit scores (`/\|(\d)( \([+-]\d+\))/g` to `| $1$2`)
      txt = txt.replaceAll( /\|(\d)( \([+-]\d+\))/g, "| $1$2");
      // Step 9b: Add spaces to space-lead scores (`/( ?\d{1,2} \([+-]\d{1,2}\))\|/g` to ` $1 |`)
      txt = txt.replaceAll( /( ?\d{1,2} \([+-]\d{1,2}\))\|/g, " $1 |");

      // Step 10: Convert title to H4, if applicable (`/^(## .+)/gm` to `##$1`)
      if ( $("#to-h4").is(":checked") ) { txt = txt.replaceAll( /(## .+)/g, "##$1"); }

      // Step 11: Include brackets:
      // Step 11a: Set classes (whether or not is a wide block)
      var open = "{{monster"
      if ( $("#frame").is(":checked") ) { open += ",frame"; }
      if ( $("#wide").is(":checked") ) { open += ",wide"; }
      // Step 11b: Encircle formatted block with brackets
      txt = open + "\n" + txt + "\n}}";

      // Step 12: Output
      $("#output").val(txt);
    }
  });

  // Clear input textarea
  $("#clear").on("click", function() {
    $("#wide").prop("checked", false);
    $("#to-h4, #frame").prop("checked", true);
    $("#output").val("");
    $("#input")
      .val("")
      .focus();
  });
});
