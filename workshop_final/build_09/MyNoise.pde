float xn() {
  return noise(x * 0.001, y * 0.001, z * 0.009) * 900;
}

float yn() {
  return noise(x * 0.001, y * 0.001, z * 0.005) * 1100;
}

float sn() {
  return noise(x * 0.1, y * 0.1, z * 0.03) * 100;
}

