importScripts("elm-worker.js");

const app = Elm.Worker.init();

onmessage = function ({ data }) {
  const { type, value } = data;

  if (type === "increment") {
    app.ports.increment.send(value);
  }

  if (type === "decrement") {
    app.ports.decrement.send(value);
  }
};

app.ports.sendCount.subscribe(function (int) {
  console.log(int);
  postMessage(int);
});
