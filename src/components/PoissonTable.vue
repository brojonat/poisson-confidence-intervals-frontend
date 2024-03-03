<template>
  <q-markup-table dense separator="cell">
    <thead>
      <th>CL</th>
      <th>\( \lambda_l \)</th>
      <th>\( \lambda_u \)</th>
    </thead>
    <tbody>
      <tr v-for="row in data" :key="row.confidence">
        <td class="text-center" :style="getStyle(row, 'confidence', cm)">
          {{ row.confidence.toFixed(4) }}
        </td>
        <td class="text-center" :style="getStyle(row, 'lower', cm)">
          {{ row.lower.toFixed(4) }}
        </td>
        <td class="text-center" :style="getStyle(row, 'upper', cm)">
          {{ row.upper.toFixed(4) }}
        </td>
      </tr>
    </tbody>
  </q-markup-table>
</template>

<script setup>
import colormap from "colormap";
const props = defineProps({ data: Array });

const baseCM = colormap({
  colormap: "magma",
  nshades: 20,
  format: "hex",
  alpha: 1,
});
const cm = baseCM.splice(10);

const cls = props.data.map(({ confidence }) => confidence);

const getStyle = (row, col, color_map) => {
  // find the confidence level in the array of confidence levels and color accordingly
  if (col === "confidence") {
    return {
      "background-color": color_map[cls.findIndex((e) => row.confidence === e)],
    };
  }
  return {};
};
</script>

<style></style>
