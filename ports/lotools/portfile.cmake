# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF 071f5a18354fd8423420fd06dfeebbc096b4344e # 0.1.5
    SHA512 31707f2300d4fb87ebb14e9312a6cc76da96860caf0c551ddb7ff3da8bddf9a7e5124816fe233945b58969a475ecd4cdfec18e5be91d2ae023dcd8d385c00eff
    HEAD_REF master
)

# 将我们自己的CMakeLists.txt复制到目录，因为这个是特别为vcpkg准备的
file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

# 配置cmake
vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

# 构建并安装
vcpkg_install_cmake()

# 修正配置文件
vcpkg_fixup_cmake_targets()

# 生成的库分为debug和release，但是头文件仅需要保留一份，所以删除debug/include
# 又由于这是一个仅头文件库，所以不需要debug，所以直接删除
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)

# 复制usage
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")