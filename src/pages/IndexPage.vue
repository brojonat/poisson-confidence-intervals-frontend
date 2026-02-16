<template>
  <q-page>
    <div class="q-pa-md">
      <div class="row justify-center">
        <div class="col-sm-6 col-xs-12 text-body1">
          <p>
            This is my app for calculating confidence intervals associated with
            Poisson and Binomial statistics for small numbers of events.
          </p>
          <q-list separator bordered class="rounded-borders">
            <q-expansion-item
              expand-separator
              label="Background Inspiration"
              header-class="expansion-card"
            >
              <q-card class="expansion-card">
                <q-card-section>
                  <p>
                    In astronomy (and maybe elsewhere too, idk), there's a
                    saying that "one might fluctuate to zero, but zero never
                    fluctuates to one". The gist is that when you're trying
                    looking for something and don't see anything, you might just
                    be unlucky, but you're
                    <i>never</i> lucky enough to see something that never
                    occurs. This app is all about quantifying just how (un)lucky
                    you are based on what you've seen.
                  </p>
                  <p>
                    For example, let's say you want to know how many Slack
                    notifications \(N\) you get in some arbitrary time interval
                    \(T\) (e.g., one minute). Suppose you sit there and count
                    the number of notifications you get and end up with...zero.
                    If you try and turn that into a rate \( \lambda \) in the
                    naive way with \( N/T \), you'd end up with zero
                    notifications per minute, but that can't be right, you get
                    LOTS of notifications every day! So, what's the "right" way
                    to estimate your notification rate?
                  </p>

                  <p>
                    When you're only expecting to see a handful of
                    (independent!) events, then you want to use the
                    <a
                      href="https://en.wikipedia.org/wiki/Poisson_distribution"
                      target="_blank"
                      >Poisson distribution:</a
                    >
                    \[P(x=k) = \frac{\lambda^k e^{-\lambda}}{k!} \]
                  </p>
                  <p>
                    This gives you the probability of observing \( k \) events
                    given some underlying average event rate \( \lambda \), but
                    we're interested in the reverse: given that we observe \( k
                    \) events, what is the rate \( \lambda \)? We can't possibly
                    determine the exact rate because of cursed statistical
                    uncertainty, but we can use the number of events that we
                    <i>did</i> observe to construct some confidence interval in
                    which we expect the true value to live.
                  </p>
                </q-card-section>
              </q-card>
            </q-expansion-item>

            <q-expansion-item
              expand-separator
              label="Nitty Gritty Details"
              header-class="expansion-card"
            >
              <q-card class="expansion-card">
                <q-card-section>
                  <p>
                    This section is a recapitulation of the main points from
                    <a
                      href="https://ui.adsabs.harvard.edu/abs/1986ApJ...303..336G/abstract"
                      target="_blank"
                      >Geherls 1986</a
                    >. See that paper and the references therein for the actual
                    proofs/derivations.
                  </p>
                  <p>
                    Consider the case where \( n \) events are detected in a
                    given observation interval. Then, based on Poisson
                    statistics, the upper limit \( \lambda_u \) and lower limit
                    \( \lambda_l \) of confidence level CL are defined by:
                  </p>
                  <p>
                    \[ \sum_{x=0}^n \frac{\lambda_u^x e^{-\lambda_u}}{x!} = 1 -
                    CL \]
                  </p>
                  <p>
                    \[ \sum_{x=0}^{n-1} \frac{\lambda_l^x e^{-\lambda_l}}{x!} =
                    CL \]
                  </p>
                  <p>
                    These are for the single sided limits. Double sided limits
                    are simply \( (1+CL)/2 \).
                  </p>
                  <p>
                    It is not possible to obtain exact algebraic expressions for
                    \( \lambda_l \) and \( \lambda_u \), but Geherls gives us
                    some useful approximations that are good to a few percent:
                  </p>
                  <p>
                    \[ \lambda_u \approx n + S\sqrt{n+1} + \frac{S^2 + 2}{3}\]
                  </p>
                  <p>
                    \[ \lambda_l \approx n \left ( 1 - \frac{1}{9n} -
                    \frac{S}{3\sqrt{n}} + \beta n^{\gamma} \right )^3 \]
                  </p>
                  <p>
                    where \(S\) is the confidence interval in terms of Gaussian
                    sigma, and \( \beta \) and \( \gamma \) are constants that
                    depend on \(S\). Here's a table of values for \( S \), \(
                    \beta \) and \( \gamma \):
                  </p>
                  <BetaGammaTable />
                </q-card-section>
              </q-card>
            </q-expansion-item>
          </q-list>
        </div>
      </div>

      <div class="row">
        <div class="col-12">
          <div class="q-pa-md text-body1">
            <p>
              To cut to the chase, there's no clean empirical way to do this;
              that's where
              <a
                href="https://ui.adsabs.harvard.edu/abs/1986ApJ...303..336G/abstract"
                target="_blank"
                >Geherls 1986</a
              >
              comes in. This dude went through and tabulated a bunch of these
              values and then provided some formulae that approximate the
              confidence intervals real well. The calculators below let you plug
              in your observations and get back the confidence intervals.
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="q-pa-md row">
      <div class="col">
        <PoissonCalculator />
      </div>
    </div>
  </q-page>
</template>

<script setup>
import { onMounted } from "vue";
import BetaGammaTable from "src/components/BetaGammaTable.vue";
import PoissonCalculator from "src/components/PoissonCalculator.vue";

onMounted(() => {
  let polyfillScript = document.createElement("script");
  let mathJaxScript = document.createElement("script");
  polyfillScript.setAttribute(
    "src",
    "https://polyfill.io/v3/polyfill.min.js?features=es6"
  );
  mathJaxScript.setAttribute(
    "src",
    "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"
  );
  mathJaxScript.setAttribute("id", "MathJax-script");
  document.head.appendChild(polyfillScript);
  document.head.appendChild(mathJaxScript);
});
const reset = () => {
  console.log("reset");
};
</script>
<style>
.math {
  font-style: italic;
}
.expansion-card {
  background-color: rgb(213, 211, 211);
}
</style>
