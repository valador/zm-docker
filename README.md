# zm-docker

docker build -t slayerus/zoneminder:1.36 --build-arg ZM_VERSION=1.36 ./zm/.
docker push slayerus/zoneminder:1.36

docker build -t slayerus/zoneminder-es:1.36 --build-arg ZM_VERSION=1.36 --build-arg ES_VERSION=v6.1.25 ./zmes/.
docker push slayerus/zoneminder-es:1.36

Example for individual file
```
$ diff -Naur filename.ext.old filename.ext > filename-patchname.diff

# PKGBUILD
cd "${srcdir}/${pkgname}-${pkgver}"
patch -uN filename.ext ../filename-patchname.diff || return 1
```
Example for multiple files
```
$ diff -Naur package-ver.old package-ver > package-patchname.diff

# PKGBUILD
cd "${srcdir}/${pkgname}-${pkgver}"
patch -uNp1 -i ../${pkgname}-patchname.diff || return 1
```

```
diff -Naur zmes/Dockerfile ./Dockerfile > ./patches/zmes/Dockerfile.diff
```

DEP's:
gomplate
python:3.8.11-alpine3.14
python_version=3.8