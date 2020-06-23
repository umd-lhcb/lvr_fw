from setuptools import setup, Extension

setup(
        ext_modules=[Extension('calc_crc',['calc_crc.C'],),]
)
