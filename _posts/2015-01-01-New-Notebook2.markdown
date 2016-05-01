---
layout:     post
title:      New Notebook 2
date:       2016-01-01 12:00:00
author:     Ahmet Cecen
tags: 		result
subtitle:  Some short description of post.
---

<script src="/project-pages/js/mermaid.min.js"></script>
<link rel="stylesheet" href="/project-pages/css/mermaid.forest.css">
<script>mermaid.initialize({startOnLoad:true});</script>

{% for post in site.posts %}
{% if post.title == page.title and post.author == page.author and post.date == page.date %}
{% assign text = post.content | split:"### " %}
{% endif %}
{% endfor %}

{% assign headercount = text | size | minus:1 %}

{% assign currentheader = text[2] | newline_to_br | split:"<br />" | first %}

<div class="mermaid">

graph TB

subgraph one
{% for header in (3..headercount) %}{% assign prevheader = currentheader %}{% assign currentheader = text[header] | newline_to_br | split:"<br />" | first %}
node{{ header | minus:1 }}({{ prevheader }}) --> node{{ header }}({{ currentheader }}){% endfor %}
end
node4 --> B

</div>



---



# Meet PyMKS

In this short introduction, we will demonstrate the functionality of PyMKS to compute 2-point statistics in order to objectively quantify microstructures, predict effective properties using homogenization and predict local properties using localization. If you would like more technical details amount any of these methods please see the [theory section](THEORY.html).


```python
%matplotlib inline
%load_ext autoreload
%autoreload 2

import numpy as np
import matplotlib.pyplot as plt
```

### Quantify Microstructures using 2-Point Statistics

Lets make two dual phase microstructures with different morphologies.


```python
from pymks.datasets import make_microstructure

X_1 = make_microstructure(n_samples=1, grain_size=(25, 25))
X_2 = make_microstructure(n_samples=1, grain_size=(15, 95))

X = np.concatenate((X_1, X_2))
```

Throughout PyMKS `X` is used to represent microstructures. Now that we have made the two microstructures, lets take a look at them.


```python
from pymks.tools import draw_microstructures

draw_microstructures(X)
```

We can compute the 2-point statistics for these two periodic microstructures using the `correlate` function from `pymks.stats`. This function computes all of the autocorrelations and cross-correlation(s) for a microstructure. Before we compute the 2-point statistics, we will discretize them using the `PrimitiveBasis` function.


```python
from pymks import PrimitiveBasis
from pymks.stats import correlate

prim_basis = PrimitiveBasis(n_states=2, domain=[0, 1])
X_ = prim_basis.discretize(X)
X_corr = correlate(X_, periodic_axes=[0, 1])
```

Let's take a look at the two autocorrelations and the cross-correlation for these two microstructures.


```python
from pymks.tools import draw_correlations

print X_corr[0].shape

draw_correlations(X_corr[0])
```

    (101, 101, 3)
    


```python
draw_correlations(X_corr[1])
```




2-Point statistics provide an object way to compare microstructures, and have been shown as an effective input to machine learning methods.

### Predict Homogenized Properties

In this section of the intro, we are going to predict the effective stiffness for two phase microstructures using the `MKSHomogenizationModel`, but we could have chosen any other effective material property.  

First we need to make some microstructures and their effective stress values to fit our model. Let's create 200 random instances 3 different types of microstructures, totaling to 600 microstructures.


```python
from pymks.datasets import make_elastic_stress_random

grain_size = [(47, 6), (4, 49), (14, 14)]
n_samples = [200, 200, 200]

X_train, y_train = make_elastic_stress_random(n_samples=n_samples, size=(51, 51),
                                              grain_size=grain_size, seed=0)
```

Once again, `X_train` is our microstructures. Throughout PyMKS `y` is used as either the prpoerty or the field we would like to predict. In this case `y_train` is the effective stress values for `X_train`. Let's look at one of each of the three different types of microstructures.


```python
draw_microstructures(X_train[::200])
```



The `MKSHomogenizationModel` uses 2-point statistics, so we need provide a discretization method for the microstructures by providing a basis function. We will also specify which correlations we want.


```python
from pymks import MKSHomogenizationModel

prim_basis = PrimitiveBasis(n_states=2, domain=[0, 1])
homogenize_model = MKSHomogenizationModel(basis=prim_basis,
                                          correlations=[(0, 0), (1, 1), (0, 1)])
```

Let's fit our model with the data we created.


```python
homogenize_model.fit(X_train, y_train, periodic_axes=[0, 1])
```

Now let's make some new data to see how good our model is.


```python
n_samples = [10, 10, 10]
X_test, y_test = make_elastic_stress_random(n_samples=n_samples, size=(51, 51),
                                            grain_size=grain_size, seed=100)
```

We will try and predict the effective stress of our `X_test` microstructures.


```python
y_pred = homogenize_model.predict(X_test, periodic_axes=[0, 1])
```

The `MKSHomogenizationModel` generates low dimensional representations of microstructures and regression methods to predict effective properties. Take a look at the low dimensional representations.


```python
from pymks.tools import draw_components

draw_components(homogenize_model.fit_data, homogenize_model.predict_data, 
                label_1='Training Data', label_2='Testing Data')
```


Now let's look at a goodness of fit plot for our `MKSHomogenizationModel`.


```python
from pymks.tools import draw_goodness_of_fit

fit_data = np.array([y_train, 
                     homogenize_model.predict(X_train, periodic_axes=[0, 1])])
pred_data = np.array([y_test, y_pred])

draw_goodness_of_fit(fit_data, pred_data, ['Training Data', 'Testing Data'])
```



Looks good.

The `MKSHomogenizationModel` can be used to predict effective properties and processing-structure evolutions.

### Predict Local Properties

In this section of the intro, we are going to predict the local strain field in a microstructure using `MKSLocalizationModel`, but we could have predicted another local property.

First we need some data, so let's make some.


```python
from pymks.datasets import make_elastic_FE_strain_delta

X_delta, y_delta = make_elastic_FE_strain_delta()
```

Once again, `X_delta` is our microstructures and `y_delta` is our local strain fields. We need to discretize the microstructure again so we will also use the same basis function.


```python
from pymks import MKSLocalizationModel

prim_basis = PrimitiveBasis(n_states=2)
localize_model = MKSLocalizationModel(basis=prim_basis)
```

Let's use the data to fit our `MKSLocalizationModel`.


```python
localize_model.fit(X_delta, y_delta)
```

Now that we have fit our model, we will create a random microstructure and compute its local strain field using finite element analysis. We will then try and reproduce the same strain field with our model.


```python
from pymks.datasets import make_elastic_FE_strain_random

X_test, y_test = make_elastic_FE_strain_random()
```

Let's look at the microstructure and its local strain field.


```python
from pymks.tools import draw_microstructure_strain

draw_microstructure_strain(X_test[0], y_test[0])
```




Now let's pass that same microstructure to our `MKSLocalizationModel` and compare the predicted and computed local strain field.


```python
from pymks.tools import draw_strains_compare


y_pred = localize_model.predict(X_test)
draw_strains_compare(y_test[0], y_pred[0])
```

Not bad.

The `MKSLocalizationModel` can be used to predict local properties and local processing-structure evolutions.

# Now Testing WorkFlows

## Test 1

### Test 2
