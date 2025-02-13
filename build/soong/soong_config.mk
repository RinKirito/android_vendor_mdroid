mdroid_soong:
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '"Mdroid": {'; \
	echo '    "Has_legacy_camera_hal1": $(if $(filter true,$(TARGET_HAS_LEGACY_CAMERA_HAL1)),true,false),'; \
	echo '    "Uses_media_extensions": $(if $(filter true,$(TARGET_USES_MEDIA_EXTENSIONS)),true,false),'; \
	echo '    "Uses_generic_camera_parameter_library": $(if $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY),false,true),'; \
	echo '    "Specific_camera_parameter_library": "$(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY)",'; \
	echo '    "Needs_text_relocations": $(if $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)),true,false),'; \
	echo '    "QTIAudioPath":  "$(call project-path-for,qcom-audio)",'; \
	echo '    "QTIDisplayPath":  "$(call project-path-for,qcom-display)",'; \
	echo '    "QTIMediaPath":  "$(call project-path-for,qcom-media)",';  \
	echo '    "Mtk_hardware": $(if $(filter true,$(BOARD_USES_MTK_HARDWARE)),true,false),'; \
	echo '    "BoardUsesQTIHardware":  $(if $(BOARD_USES_QTI_HARDWARE),true,false),';  \
	echo '    "Uses_qti_camera_device": $(if $(filter true,$(TARGET_USES_QTI_CAMERA_DEVICE)),true,false),'; \
	echo '    "Libart_img_base": "$(LIBART_IMG_BASE)",'; \
	echo '    "Cant_reallocate_omx_buffers":  $(if $(filter omap4,$(TARGET_BOARD_PLATFORM)),true,false),';  \
	echo '    "Use_legacy_rescaling":  $(if $(strip $(TARGET_OMX_LEGACY_RESCALING)),true,false),';  \
	echo '    "Uses_qcom_bsp_legacy": $(if $(filter true,$(TARGET_USES_QCOM_BSP_LEGACY)),true,false),'; \
	echo '    "Target_shim_libs": "$(subst $(space),:,$(TARGET_LD_SHIM_LIBS))"'; \
	echo '},'; \
	echo '') > $(SOONG_VARIABLES_TMP)
