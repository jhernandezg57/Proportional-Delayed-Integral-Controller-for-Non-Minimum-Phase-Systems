## Proportional Delayed Integral Controller for Stabilizing Second-Order Non-Minimum Phase Systems


### System Definition

The system is defined as:

$$
G(s) \triangleq \frac{P(s)}{Q(s)} := \frac{K \omega_n^2 (1 - z s)}{s^2 + 2 \zeta \omega_n s + \omega_n^2}, \quad K \in \mathbb{R}_+, \, \zeta \in \mathbb{R}, \, \omega_n \in \mathbb{R} \setminus\{0\} \,  \in \overline{\mathbb{R}}_{+}
$$

and it is to be controlled in a closed-loop system using modified classical PI controller called P$\delta$I of the form:

$$
C_{P\delta I}(s) \triangleq k_p + \frac{k_i}{s}e^{-h s}, \quad k_p, k_i \in \mathbb{R}, \quad h \in \overline{\mathbb{R}}_{+}.
$$

The codes allow to obtain the stability regions to be able to tune stabilizing controllers.

## References
Author **Julián-Alejandro Hernández-Gallardo** 2025. 

If you are utilizing this algorithm, please cite [![DOI](https://zenodo.org/badge/923116128.svg)](https://doi.org/10.5281/zenodo.15649843) 

If you are interested in reading any of my other publications

<https://scholar.google.com/citations?user=ru2cJxEAAAAJ&hl=es&oi=ao>
