const WebSocket = require("ws");
const FakeData = require("./fakeData");

const wss = new WebSocket.Server({ port: 8082 });
const key = "123456789"; // Analyzer key
let isKeyVerified = false;

wss.on("connection", (ws) => {
  console.log("New client connected!");

  const sendData = () =>
    ws.send(JSON.stringify(FakeData.createFakeData(isKeyVerified)));

  var interval = setInterval(sendData, 5000);

  ws.on("message", (message) => {
    var data = JSON.parse(message);

    // keys dont match => send to app isKeyVerified: false, and terminate connection
    if (data.key !== key) {
      ws.send(JSON.stringify(FakeData.createFakeData(isKeyVerified)));
      ws.terminate();
      return;
    }

    // Keys match => send data to app
    isKeyVerified = true;
    ws.send(JSON.stringify(FakeData.createFakeData(isKeyVerified)));
  });

  // Connection closed => set isKeyVerified to false and clear interval
  ws.on("close", () => {
    isKeyVerified = false;
    clearInterval(interval);
    console.log("Client disconnected!");
  });
});
