#target photoshop


function main() {
  var guides = getGuides(app.activeDocument);

  if (guides[0].length !== 2 || guides[1].length !== 2) {
    alert('Error: need exactly 2 horizontal and 2 vertical guides');
    return;
  }

  var x = guides[1][0],
      y = guides[0][0],
      w = guides[1][1] - guides[1][0],
      h = guides[0][1] - guides[0][0];

  copyTextToClipboard(x + ',' + y + ',' + w + ',' + h);
}


function copyTextToClipboard(txt) {
  // mostly yoinked from:
  // https://stackoverflow.com/questions/4066108/photoshop-jsx-how-do-i-copy-arbitrary-text-to-the-clipboard
  var keyTextData = app.charIDToTypeID('TxtD'),
      ktextToClipboardStr = app.stringIDToTypeID('textToClipboard'),
      textStrDesc = new ActionDescriptor();

  textStrDesc.putString(keyTextData, txt);
  executeAction(ktextToClipboardStr, textStrDesc, DialogModes.NO);
}


function getGuides(doc) {
  // mostly yoinked from:
  // https://superuser.com/questions/459216/how-to-get-exact-position-of-a-ruler-guide-in-photoshop/573629
  var i, l, g, d,
      guides = [[],[]];

  for (i = 0, l = doc.guides.length; i < l; i++) {
    g = doc.guides[i];
    d = (g.direction === Direction.HORIZONTAL) ? 0 : 1;
    guides[d].push(parseInt(g.coordinate));
  }

  guides[0].sort(numSort);
  guides[1].sort(numSort);

  return guides;
}

function numSort(a,b) {
  return a - b;
}


main();
