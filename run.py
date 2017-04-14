#!/usr/bin/env python3

import subprocess
import time
import shlex
import os

os.mkdir('output')

def run(args, on='ubuntu', withOutput=False, stdoutTo=None, **envVars):
    cmd = ['docker', 'run']
    if withOutput:
        cmd += ['--volume', os.path.abspath('output') + ':/output']
    for key, value in envVars.items():
        cmd += ['--env', '%s=%s' % (key, value)]
    cmd += ['openteacher:' + on] + shlex.split(args)
    print('> ' + ' '.join(cmd))
    if stdoutTo:
        with open(stdoutTo, 'wb') as f:
            f.write(subprocess.check_output(cmd))
    else:
        subprocess.check_call(cmd)

# coverage
run('-p test-suite all', withOutput=True, COV='/output/coverage')
# profiling
run('-p non-existing-profile', withOutput=True, PROFILING='/output/profiling')

# code complexity
run('-p code-complexity', stdoutTo='output/code-complexity.txt')

# web stuff
run('-p generate-mobile /output/mobile', withOutput=True)
run(' '.join([
    '-p', 'generate-web', '/output/web',
    'http://web.openteacher.org:5984',
    'http://web.openteacher.org/services'
]), withOutput=True)
run('-p generate-website /output/website', withOutput=True)
run(
    '-p generate-business-card /output/openteacher-business-card.png',
    withOutput=True)

# source
run('-p package-source /output/source.zip', withOutput=True)
run(
    '-p package-source-with-setup /output/source-with-setup.tar.gz',
    withOutput=True)

buildNum = int(time.time())

# debian
version = '0timestamp' + str(buildNum)
run(
    '-p package-debian {version} /output false'.format(version=version),
    withOutput=True)

# fedora
run(
    '-p package-rpm %s /output/fedora.rpm' % buildNum,
    on='fedora',
    withOutput=True)

# arch
run(
    '-p package-arch %s /output/arch.pkg.tar.xz' % buildNum,
    on='arch',
    withOutput=True)
