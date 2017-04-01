#! /bin/sh
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.
MAKE="make -j4"
export MAKE
export V=0
cd SageMath || (echo "Cannot cd into SageMath"; exit 1)
# Patch out the broken V=0 from #22418
sed -i.orig 's/^export V=1/if test x$use_prefix = xtrue; then export V=1; fi/;' build/bin/sage-logger
# To initialize matplotlib font manager
# -- otherwise there will be output during doctests causing failures
fc-cache --really-force
./sage -c 'import matplotlib.pyplot'
# Test if it runs
#./sage -t src/sage/geometry || errors="$errors src/sage/geometry"
# Install packages
./sage -i lrslib    || errors="$errors lrslib"
#./sage -i latte_int || errors="$errors latte_int"
#./sage -i topcom    || errors="$errors topcom"
#./sage -i qhull     || errors="$errors qhull"
#./sage -i -y polymake  || errors="$errors polymake"
./sage -i pynormaliz|| errors="$errors pynormaliz"
# Test if it runs
./sage -t src/sage/geometry/polyhedron || errors="$errors src/sage/geometry/polyhedron"
# Install packages
#./sage -i cbc       || errors="$errors cbc"
#./sage -i -y scipoptsuite || errors="$errors scipoptsuite"
#./sage -t src/sage/numerical || errors="$errors src/sage/numerical"
echo "########################################################################################"
echo "############################## SUMMARY #################################################"
echo "########################################################################################"
if [ -z "$errors" ]; then
    echo "All tests pass"
else
    echo "Errors: $errors"
    for a in logs/*.log logs/pkgs/*.log ; do
        echo "################### $a ##################"
        cat $a
    done
    exit 1
fi
