"""
Python packaging definition for Chevah GPG binary files.
"""
from setuptools import setup, Command
import os

NAME = 'chevah-gpg'
MODULE_NAME = 'chevah_gpg'
VERSION = '1.4.23'
CHEVAH_VERSION = '+chevah.6'
WEBSITE = 'https://gnupg.org/'
AUTHOR = 'OpenPG Contributors'
LICENSE = 'GPL 3+'

package_name = 'chevah.' + MODULE_NAME

setup(
    name=NAME,
    version=VERSION + CHEVAH_VERSION,
    author=AUTHOR,
    author_email='hidden',
    maintainer="Adi Roiban",
    maintainer_email="adi.roiban@chevah.com",
    license=LICENSE,
    platforms='any',
    description='Files for %s used in Chevah project.' % (MODULE_NAME),
    long_description=open('README.rst').read(),
    url=WEBSITE,
    namespace_packages=['chevah'],
    packages=['chevah', package_name],
    package_dir={package_name: 'chevah/' + MODULE_NAME},
    package_data={package_name: ['*']},
    )
