<template>
  <div class="row justify-left">
    <div class="col-xs-12 col-sm-3 offset-sm-3">
      <q-input
        label="Observed Event Count"
        type="number"
        v-model.number="eventCount"
      />
    </div>
  </div>
  <div class="row justify-center">
    <div class="col-xs-12 col-sm-6">
      <PoissonTable :data="data" />
    </div>
  </div>
</template>
<script setup>
import { ref, computed } from "vue";
import PoissonTable from "src/components/PoissonTable.vue";

const computeLower = (n, S) => {
  if (!n) {
    return 0;
  }
  const b = lookup[S].b;
  const g = lookup[S].g;
  return n * (1 - 1 / (9 * n) - S / (3 * Math.sqrt(n)) + b * n ** g) ** 3;
};

const computeUpper = (n, S) => {
  if (!n) {
    return 0;
  }
  return n + S * Math.sqrt(n + 1) + (S ** 2 + 2) / 3;
};

const eventCount = ref(0);
const cls = [
  0.8413, 0.9, 0.95, 0.975, 0.9772, 0.99, 0.995, 0.9987, 0.999, 0.9995,
];
const lookup = {
  0.8413: { s: 1, b: 0, g: 1 },
  0.9: { s: 1.282, b: 0.01, g: -4.0 },
  0.95: { s: 1.645, b: 0.031, g: -2.5 },
  0.975: { s: 1.96, b: 0.58, g: -2.22 },
  0.9772: { s: 2.0, b: 0.062, g: -2.19 },
  0.99: { s: 2.326, b: 0.103, g: -2.07 },
  0.995: { s: 2.576, b: 0.141, g: -2.0 },
  0.9987: { s: 3.0, b: 0.222, g: -1.88 },
  0.999: { s: 3.09, b: 0.241, g: -1.85 },
  0.9995: { s: 3.291, b: 0.287, g: -1.8 },
};

const data = computed(() => {
  const res = [];
  cls.forEach((cl) => {
    res.push({
      confidence: cl,
      lower: computeLower(eventCount.value, cl),
      upper: computeUpper(eventCount.value, cl),
    });
  });
  return res;
});
</script>
<style></style>
