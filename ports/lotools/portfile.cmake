# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF fa113ba26ca23fd2a779462d4284356e690efb6e # 0.0.6
    SHA512 2a43f0f44bf506de229a7196306921be3adcc1a57d6ec70a3106508b9c5f5bfc7adb306a642f1bf9e4cd0751dff05d81a868aaf1186e801196fe430fddad3930
    HEAD_REF master
)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/include/lotools DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)
# vcpkg_copy_pdbs()

