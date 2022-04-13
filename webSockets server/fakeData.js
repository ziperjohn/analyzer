const portStateList = ["ON", "OFF", "ECHO", "ERROR"]; // Analyzer port state
const fwVersion = "0.1.0"; // Analyzer firmware version

const getRandomInt = () => {
  return Math.floor(Math.random() * 4);
};

const getRandomFloat = () => {
  return (Math.random() * (50 - 5) + 5).toFixed(2) * -1.0;
};

const createFakeData = (isKeyVerified) => {
  const portList = [];
  const otdrList = [];

  // Wrong key => return empty data
  if (!isKeyVerified) {
    return {
      isKeyVerified: isKeyVerified,
      fwVersion: "0.0.0",
      portList: portList,
      otdrList: otdrList,
    };
  }

  for (let i = 0; i < 20; i++) {
    portList.push({ id: i, state: portStateList[getRandomInt()] });
  }

  for (let i = 0; i <= 50; i++) {
    otdrList.push({ distance: parseFloat(i), power: getRandomFloat() });
  }

  return {
    isKeyVerified: isKeyVerified,
    fwVersion: fwVersion,
    portList: portList,
    otdrList: otdrList,
  };
};

module.exports = {
  createFakeData,
};
