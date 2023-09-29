import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="iam-scim-map",
    version="0.0.1",
    author="dciangot",
    author_email="diego.ciangottini@gmail.com",
    description="CLI to map IAM token subjects to application username",
    long_description=long_description,
    url="https://github.com/dodas-ts/iam-scim-map",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: Apache2 License",
        "Operating System :: OS Independent",
    ],
    python_requires="~=3.6",
    license="MIT",
    scripts=['bin/iam-scim-map'],
    install_requires=[
    'kubernetes',
    'liboidcagent',
    'requests'
   ]
)
