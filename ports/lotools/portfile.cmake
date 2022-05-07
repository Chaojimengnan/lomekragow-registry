# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF 060ccbdf8e6003582bb49feedcf67f92ab5cabc7 # 0.0.5
    SHA512 8686c4cb3c11e678064edf34caaba3a9ddf16b6b04ecd6e6d2104f7d75fcfcd005abbdcdf2ca48075495946ec71e3ba3631878e51d5585317bf96cdcef247f35
    HEAD_REF master
)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/include/lotools DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)
# vcpkg_copy_pdbs()

