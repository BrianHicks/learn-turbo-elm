interface Window {
  Elm: {
    Main: {
      init(config: { node: HTMLElement }): any;
    };
  };
}

(function () {
  const root = document.getElementById("elm-root");
  if (!root) {
    alert(
      "could not find elm-root. This is a misconfiguration; make some noise!",
    );
    return;
  }

  window.Elm.Main.init({ node: root });
})();
