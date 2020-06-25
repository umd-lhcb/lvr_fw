from setuptools import setup, Extension

setup(
        ext_modules=[Extension('bare_crc',['bare_crc.C'],),]
)
