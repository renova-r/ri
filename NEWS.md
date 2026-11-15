# ri 0.9.9001

Renova release, based on CRAN ri 0.9 (archived on CRAN 2022-05-09).

- `NAMESPACE`: added `importFrom()` declarations for functions the code already calls: `graphics` (`abline`, `hist`, `lines`, `symbols`), `stats` (`aggregate`, `ave`, `lm`, `quantile`, `uniroot`, `weighted.mean`) and `utils` (`combn`).
- `man/dispdist.Rd`, `man/omni.ate.Rd`: the Samii and Aronow (2012) reference link `\url{http://dx.doi.org/10.1016/j.spl.2011.10.024}` is now `\doi{10.1016/j.spl.2011.10.024}` (documentation only).
- No R code change; the original `DESCRIPTION` fields (including `Author` and `Date`) are retained.
- `DESCRIPTION`: `Version` set to `0.9.9001`; "Compatibility updates by Renova." appended to `Description`.
- The stale `MD5` file was removed.
- `COPYING` (GNU GPL version 2 text) was added; the `License` field is unchanged.
- `README.md` was added and `.Rbuildignore` keeps `README.md` and `NEWS.md` out of the built package.
