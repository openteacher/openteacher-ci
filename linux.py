#!/usr/bin/env python3

import subprocess
import time
import shlex
import os

def run(args, on='ubuntu', withOutput=False, logTo=None, **envVars):
    cmd = ['docker', 'run']
    if withOutput:
        cmd += ['--volume', os.path.abspath('output') + ':/output']
    for key, value in envVars.items():
        cmd += ['--env', '%s=%s' % (key, value)]
    cmd += ['openteacher/openteacher:' + on] + shlex.split(args)
    print('$ ' + ' '.join(cmd))
    if logTo:
        print("# logging to: " + logTo)
        with open(logTo, 'wb') as f:
            subprocess.check_call(cmd, stdout=f, stderr=f)
    else:
        subprocess.check_call(cmd)

# coverage
run('-p test-suite all', withOutput=True, COV='/output/coverage')
# profiling
run('-p non-existing-profile', withOutput=True, PROFILING='/output/profiling')

# code complexity
run('-p code-complexity', logTo='output/code-complexity.txt')

# web stuff
run('-p generate-mobile /tmp/mobile')
run(' '.join([
    '-p', 'generate-web', '/tmp/web',
    'http://web.openteacher.org:5985',
    'http://web.openteacher.org/services'
]))
run('-p generate-website /output/website', withOutput=True)
run(
    '-p generate-business-card /output/openteacher-business-card.png',
    withOutput=True)

# source
run('-p package-source /output/source.zip', withOutput=True)
run(
    '-p package-source-with-setup /output/source-with-setup.tar.gz',
    withOutput=True)

buildNum = os.environ.get('BUILD_NUMBER', int(time.time()))

# debian
version = '0timestamp%s' % buildNum
run(
    '-p package-debian {version} /output false'.format(version=version),
    withOutput=True,
    logTo='output/logs/package-debian.txt')

# fedora
run(
    '-p package-rpm %s /output/fedora.rpm' % buildNum,
    on='fedora',
    withOutput=True,
    logTo='output/logs/package-fedora.txt')

# arch
run(
    '-p package-arch %s /output/arch.pkg.tar.xz' % buildNum,
    on='arch',
    withOutput=True,
    logTo='output/logs/package-arch.txt')
