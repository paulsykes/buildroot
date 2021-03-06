################################################################################
#
# hiredis
#
################################################################################

HIREDIS_VERSION_MAJOR = 1.0
HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
HIREDIS_LICENSE = BSD-3-Clause
HIREDIS_LICENSE_FILES = COPYING
HIREDIS_INSTALL_STAGING = YES
HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON

ifeq ($(BR2_PACKAGE_OPENSSL),y)
HIREDIS_CONF_OPTS += -DENABLE_SSL=ON
HIREDIS_DEPENDENCIES += openssl
else
HIREDIS_CONF_OPTS += -DENABLE_SSL=OFF
endif

$(eval $(cmake-package))
