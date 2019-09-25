# CFML-lambda-far-arrow-functions
A quick set of tests for Lucee, Adobe CF, and JS for fat arrow functions

```js
func = (x) => x+1
func(1)
```

Each file has the same basic tests, I've commented out any tests that throw an error.

* **AdobeCF.cfm** - Run this on Adobe CF 2018 Update 5 or later
* **Lucee.cfm** - Run this on Lucee 5
* **JavaScript.html** - Just open this in your browser to run it.  It's a reference implmentation just using JavaScript.

You can use CommandBox to start up your servers like so:

```bash
server start cfengine=lucee@5
server start cfengine=adobe@2018
```

