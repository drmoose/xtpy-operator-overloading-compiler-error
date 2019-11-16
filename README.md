# Overload Resolution Ambiguity Example

This repository includes two branches, `works-with-old-pybind` and `master`, which differ only by the pybind11 submodule version.

## The Error

Trying to compile on master yields:

```
    main.cpp:19:12: error: request for member ‘operator+=’ is ambiguous
       19 |  sample += 5.0;
          |            ^~~
    In file included from xtensor-python/include/xtensor-python/pytensor.hpp:19,
                     from main.cpp:6:
    xtensor/include/xtensor/xsemantic.hpp:92:23: note: candidates are: ‘template<class E> xt::xsemantic_base<D>::derived_type& xt::xsemantic_base<D>::operator+=(const xt::xexpression<E1>&) [with E = E; D = xt::pytensor<double, 1>]’
       92 |         derived_type& operator+=(const xexpression<E>&);
          |                       ^~~~~~~~
    xtensor/include/xtensor/xsemantic.hpp:68:47: note:                 ‘template<class E> xt::disable_xexpression<E, typename std::conditional<xt::detail::is_sharable<D>::value, xt::xsharable_expression<E>, xt::xexpression<D> >::type::derived_type&> xt::xsemantic_base<D>::operator+=(const E&) [with E = E; D = xt::pytensor<double, 1>]’
       68 |         disable_xexpression<E, derived_type&> operator+=(const E&);
          |                                               ^~~~~~~~
    In file included from pybind11/include/pybind11/cast.h:13,
                     from pybind11/include/pybind11/attr.h:13,
                     from pybind11/include/pybind11/pybind11.h:44,
                     from pybind11/include/pybind11/embed.h:12,
                     from main.cpp:3:
    pybind11/include/pybind11/pytypes.h:128:12: note:                 ‘pybind11::object pybind11::detail::object_api<Derived>::operator+=(const pybind11::detail::object_api<Derived>&) const [with Derived = pybind11::handle]’
      128 |     object operator+=(object_api const &other) const;
          |            ^~~~~~~~
```

## Usage

Don't forget to `git submodule update --init`.

* `./compile.sh` - If you've got Fedora Rawhide, ArchLinux (or some other linux distro that puts numpy at `/usr/lib/python3.8/site-packages/numpy` and provides a `python3-embed.pc` symlink), this'll reproduce the error on bare metal.

* `./docker_run.sh` - This will build the included Dockerfile and attempt to compile using it.
