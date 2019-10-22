#####################################
Happy Snail Hub Layer: Orange Pi Zero
#####################################

*********************
Image build procedure
*********************

#. Download this repository::

     git clone https://github.com/forGGe/HappySnail-meta-happysnail-bsp meta-happysnail-bsp

#. Download Yocto and dependencies::

     git clone -b warrior git://git.yoctoproject.org/poky.git poky-hs
     git clone https://github.com/linux-sunxi/meta-sunxi
     git clone https://github.com/openembedded/meta-openembedded meta-oe

#. Configure build environment::

     export MACHINE="orange-pi-zero"
     export PACKAGE_CLASSES="package_ipk"
     cd poky-hs
     source ./oe-init-build-env
     bitbake-layers add-layer ../../meta-oe/meta-oe/
     bitbake-layers add-layer ../../meta-oe/meta-networking/
     bitbake-layers add-layer ../../meta-sunxi/
     bitbake-layers add-layer ../../meta-happysnail-bsp/

#. Start image build::

    bitbake happysnail-image-minimal

**********************
Image deploy procedure
**********************

Image must be deployed to SD card using ``dd``::

  # Assuming $PWD is poky-hs/build/
  dd status=progress if="tmp/deploy/happysnail-image-minimal-orange-pi-zero.sunxi-sdimg" of=/dev/sdX bs=1M

where ``/dev/sdX`` is a block device assigned to SD card.
