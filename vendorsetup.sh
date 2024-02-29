echo "Cloning sm8150-Common Tree"
git clone https://github.com/ankitstha/sm8150-common.git --depth=1 device/oneplus/sm8150-common
echo ""

echo "Cloning kernel tree"
git clone https://github.com/ankitstha/Neptune_kernel_sm8150_oneplus.git --depth=1 kernel/oneplus/sm8150
echo ""

echo "Cloning Vendor blobs"
git clonehttps://github.com/ankitstha/vendor_guacamole.git --depth=1 vendor/oneplus/guacamole
echo ""

# Qcom components
echo "Cloning Qcom components"
git clone https://github.com/yaap/device_qcom_common.git --depth=1  -b fourteen device/qcom/common
git clone https://gitlab.com/yaosp/vendor_qcom_common.git --depth=1 -b fourteen vendor/qcom/common
git clone https://github.com/yaap/vendor_qcom_opensource_core-utils.git -b fourteen vendor/qcom/opensource/core-utils
git clone https://github.com/AOSPA/android_device_qcom_qssi.git device/qcom/qssi
git clone https://github.com/RisingOS-staging/vendor_qcom_opensource_commonsys_dpm -b fourteen vendor/qcom/opensource/commonsys/dpm
echo ""

#  Apps
echo "Cloning Apps"
git clone https://github.com/KProfiles/android_packages_apps_Kprofiles packages/apps/Kprofiles
git clone https://gitlab.com/PixelPlusUI-SnowCone/vendor_oneplus_apps.git vendor/oneplus/apps
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