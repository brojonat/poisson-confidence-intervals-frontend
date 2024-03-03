<template>
  <div class="q-pa-md">
    <q-markup-table>
      <thead>
        <tr>
          <th></th>
          <th class="text-center" colspan="10">Confidence Level</th>
        </tr>
        <tr>
          <th class="text-left">Parameter</th>
          <th class="text-right">0.8413</th>
          <th class="text-right">0.900</th>
          <th class="text-right">0.950</th>
          <th class="text-right">0.975</th>
          <th class="text-right">0.9772</th>
          <th class="text-right">0.990</th>
          <th class="text-right">0.995</th>
          <th class="text-right">0.9987</th>
          <th class="text-right">0.999</th>
          <th class="text-right">0.9995</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="text-left">\( S^a \)</td>
          <td class="text-right">1.000</td>
          <td class="text-right">1.282</td>
          <td class="text-right">1.645</td>
          <td class="text-right">1.960</td>
          <td class="text-right">2.000</td>
          <td class="text-right">2.326</td>
          <td class="text-right">2.576</td>
          <td class="text-right">3.000</td>
          <td class="text-right">3.090</td>
          <td class="text-right">3.291</td>
        </tr>
        <tr>
          <td class="text-left">\( \beta \)</td>
          <td class="text-right">0.0</td>
          <td class="text-right">0.010</td>
          <td class="text-right">0.031</td>
          <td class="text-right">0.058</td>
          <td class="text-right">0.062</td>
          <td class="text-right">0.103</td>
          <td class="text-right">0.141</td>
          <td class="text-right">0.222</td>
          <td class="text-right">0.241</td>
          <td class="text-right">0.287</td>
        </tr>
        <tr>
          <td class="text-left">\( \gamma \)</td>
          <td class="text-right">N/A</td>
          <td class="text-right">-4.00</td>
          <td class="text-right">-2.50</td>
          <td class="text-right">-2.22</td>
          <td class="text-right">-2.19</td>
          <td class="text-right">-2.07</td>
          <td class="text-right">-2.00</td>
          <td class="text-right">-1.88</td>
          <td class="text-right">-1.85</td>
          <td class="text-right">-1.80</td>
        </tr>
        <tr>
          <td colspan="10">\(^a \) Number of Gaussian \( \sigma \)</td>
        </tr>
      </tbody>
    </q-markup-table>
  </div>
</template>

<style>
td:empty {
  visibility: hidden;
}
td:blank {
  visibility: hidden;
}
</style>
