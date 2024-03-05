# Clone/Fetch Upstream Device Dependencies
# Device Tree
echo "Cloning sm8150-Common Tree"
git clone --depth=1 https://github.com/ankitstha/device_oneplus_sm8150-common.git -b 14-B device/oneplus/sm8150-common
echo ""

echo "Cloning kernel tree"
git clone --depth=1 https://github.com/Codecity001/Neptune_kernel_sm8150_oneplus.git -b inline-erofs kernel/oneplus/sm8150
echo ""

echo "Cloning Hardware"
git clone https://github.com/ankitstha/hardware_oneplus.git -b 14 hardware/oneplus
echo ""

echo "Cloning Vendor blobs"
git clone --depth=1 https://github.com/ankitstha/vendor_oneplus_guacamole.git -b 14 vendor/oneplus/guacamole
git clone --depth=1 https://github.com/ankitstha/vendor_oneplus_sm8150-common.git -b 14 vendor/oneplus/sm8150-common
echo ""

# Qcom components
echo "Cloning Qcom components"
git clone --depth=1 https://github.com/AOSPA/android_device_qcom_common.git -b uvite device/qcom/common
git clone --depth=1 https://github.com/ThankYouMario/proprietary_vendor_qcom_common.git -b uvite vendor/qcom/common
git clone https://github.com/AOSPA/android_device_qcom_qssi.git -b uvite device/qcom/qssi
git clone https://github.com/ankitstha/vendor_qcom-opensource_core-utils.git -b uvite vendor/qcom/opensource/core-utils
git clone https://github.com/RisingOS-staging/vendor_qcom_opensource_commonsys_dpm -b fourteen vendor/qcom/opensource/commonsys/dpm
echo ""

#  Apps
echo "Cloning Apps"
git clone https://github.com/KProfiles/android_packages_apps_Kprofiles packages/apps/Kprofiles
git clone https://gitlab.com/PixelPlusUI-SnowCone/vendor_oneplus_apps vendor/oneplus/apps
echo ""

# URL of the ZIP file
zip_url="https://sourceforge.net/projects/evolutionx-guacamole/files/firmware_oneplus7pro.zip/download"

# Destination directory for extraction
extract_dir="vendor/oneplus/guacamole/"
extract_dir_check="vendor/oneplus/guacamole/radio"

# Check if files already exist in the destination directory
if [ -e "$extract_dir_check/modem.img" ] && [ -e "$extract_dir_check/abl.img" ]; then
    echo "Firmware already exist. No need to download."
else
    # Download the ZIP file
    curl -LJO "$zip_url"

    # Check if the download was successful
    if [ $? -eq 0 ]; then
        echo "Firmware Download successful. Extracting..."
        # Extract the ZIP file
        unzip -q "*.zip" -d "$extract_dir"
        echo "Firmware Extraction complete."
        # Optional: Remove the downloaded ZIP file
        rm *.zip
    else
        echo "Firmware Download failed."
    fi
fi
