"""
Python packaging definition for Selenium Drivers files.
"""
from setuptools import setup, Command
import os

NAME = 'chevah-gpg'
MODULE_NAME = 'chevah_gpg'
VERSION = '1.4.23'
CHEVAH_VERSION = '.chevah1'
WEBSITE = 'https://gnupg.org/'
AUTHOR = 'OpenPG Contributors'
LICENSE = 'GPL 3+'


class PublishCommand(Command):
    """
    Publish the source distribution to local pypi cache and remote
    Chevah PyPi server.
    """

    description = "copy distributable to Chevah cache folder"
    user_options = []

    def initialize_options(self):
        self.cwd = None

    def finalize_options(self):
        self.cwd = os.getcwd()

    def run(self):
        assert os.getcwd() == self.cwd, (
            'Must be in package root: %s' % self.cwd)
        self.run_command('bdist_wheel')
        # Upload package to Chevah PyPi server.
        upload_command = self.distribution.get_command_obj('upload')
        upload_command.repository = u'chevah'
        self.run_command('upload')

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
    packages=['chevah', 'chevah.' + MODULE_NAME],
    scripts=[
        'build/gpg',
        'build/gpg.exe',
        'build/iconv.dll',
        ],
    cmdclass={
        'publish': PublishCommand,
        },
    )
