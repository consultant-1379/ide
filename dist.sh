#!/bin/bash                                                                                                                                                               

SRC=${1}
DEST=${2}

copy_gpg_key()
{
echo "-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2.0.14 (GNU/Linux)

mQENBFVMscwBCAC7kucombdxX89Gc24Fb7BOK9VFrqyL6+mLuftc7U6mZs2TcP/T
tQSSoaV61aiYGJOzpz2kwJuvuwwyHdjjma4I3tFErV/7K2ysdhi20tm7QDmm7Jgw
J054XJobbdRc01AaN3aPQG5aUvev8t6O01E1Wl7oMfqLUmLQOK2O3agUiISe0gLQ
mUdltR9Msn6c7VSr2yxYdx5V6OSrV541GuQO1UL1sNa42cOXzZaAzZZM+SkNiUuA
Ois5kS1Tq3cr1uL1Js4qcJRntYdhuhLvD/KTMjZz1/nPW5b0+3Vvn/z4AKW/BuHV
UB8EkHDo4i3wcMgamJC8jqGZMmPB5gCELAqRABEBAAG0OlBEVSBOQU0gREUgSURF
IFRlYW0gPFBETFVDVFVSRUVAcGRsLmludGVybmFsLmVyaWNzc29uLmNvbT6JATgE
EwECACIFAlVMscwCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEE9d2ZTV
LbKrasMIAKugh47Vz/AoGR+5G42xQkwZ94AI+PEIXfkw/EjpuHUNwtaPxOnUJl9P
zi0wEn9fftWIZdDKXJUese//ELLGvdRoxr4yE7hwNDerp9rHF/t7R9vzdqNCcmWW
z/9jhBawKUvdHf73GmI6WsW5k41G8yTKahYuKnf8CyKvYrwD0Bu0LPccv8VJ1KqS
toYG1/FN4IOUvwYDCrJH1OyW7dYoBZXydu7fLn9XIKxyzU4iRiq74mPDanCti3Ib
tIU3TUtQJYvOeZpoPI9rj33u9eqknG2JJQ2WIn6MmG2gzYpVAek5k4bpJyAx5Qll
KLbZZjRNxVTyOZGr1XquOwQ37dJ+b5y5AQ0EVUyxzAEIANtCfrxRE8vXPHAFNLYC
gO/5RfX7sleWwAECfj0VC0oaM0Zle4C10K+zNSQakrSfTXYyHI18T7gB3yxYCQ4M
iQMVJEb9JCknIuXOEiq7kbQE7wDm1lZ91bnZsukWTfV8ajJBPSIzrLNSLgUBsWge
rWaexWtzNrgMwUERxqXTOQYhroY+Irx8l67OVD5uDvQvin6DITAy+Zb9shd1xWrA
lNg+FDpsnydaX83pGhx2h1bSouglQHC8Cmp2L8lS5lDj5fhAPMvtaOZHtdJeVldx
kosdDH6XK3aQAlQ4j1w8Uq0e4xjGJvEMuQGqxc+KIFJfp7J+dW7p/mlj6oyHiy6O
I7kAEQEAAYkBHwQYAQIACQUCVUyxzAIbDAAKCRBPXdmU1S2yqyj+CAC6ykjON0Jg
3CFeYpZrj/MswpZr4W4qbQvP/LAw6BHwPsBfVCm3XuWkgTCw1d5CCQw34Lc6hWE5
mSpc074TZfotAj6uK4JZWYb7dcxY8D8JLZdcggysL8bM6tA4WERMbwjktJbOOwGr
5/PyxQmyINY/8w7m8oRhb/GX+PL+Bxc6ZisjFHwWa2C+VbU7r4gfoiWRABc5YexL
NyKe94xsmYuUVDkiiXAl1GUk8HgovLNl6xDFWI+Du+RpNUccDIo8eygajUoq/pFq
kThAArUJ6/mgPyoEgnVEOnCXORwip7G4pA9R+TaQGf88qLTnDnYrfqxe49wnFVOF
30chAZjN44fS
=U0TV
-----END PGP PUBLIC KEY BLOCK-----" >${DEST}/enm-ide.gpg.key
}

if [ -d ${DEST} ]; then
    rm -fr ${DEST}
    mkdir -p ${DEST}/conf
fi

copy_gpg_key

find ${SRC} -name "*.deb" -exec cp -v {} ${DEST}/ \;
cp ${SRC}/install.sh ${DEST}

echo "Codename: trusty
Components: main
Architectures: i386 amd64
SignWith: C67652AA" >${DEST}/conf/distributions

find ${DEST} -name \*.deb -exec reprepro -Vb ${DEST} includedeb trusty {} \;
