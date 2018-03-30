package android
type Product_variables struct {
	Has_legacy_camera_hal1 struct {
		Cflags []string
	}

	Uses_media_extensions struct {
		Cflags []string
	}

	Needs_text_relocations struct {
		Cppflags []string
	}

	Mtk_hardware struct {
		Cflags []string
	}

	Cant_reallocate_omx_buffers struct {
		Cflags []string
	}

	Use_legacy_rescaling struct {
		Cflags []string
	}

	Uses_generic_camera_parameter_library struct {
		Srcs []string
	}
	Uses_qcom_bsp_legacy struct {
		Cppflags []string
	}
	Target_shim_libs struct {
		Cppflags []string
 	}
	Uses_qti_camera_device struct {
		Cppflags []string
		Shared_libs []string
	}
}

type ProductVariables struct {
	Has_legacy_camera_hal1  *bool `json:",omitempty"`
	Uses_media_extensions   *bool `json:",omitempty"`
	Uses_generic_camera_parameter_library  *bool `json:",omitempty"`
	Specific_camera_parameter_library  *string `json:",omitempty"`
	Needs_text_relocations  *bool `json:",omitempty"`
	QTIAudioPath            *string `json:",omitempty"`
	QTIDisplayPath          *string `json:",omitempty"`
	QTIMediaPath            *string `json:",omitempty"`
	Mtk_hardware            *bool `json:",omitempty"`
	Cant_reallocate_omx_buffers *bool `json:",omitempty"`
	Use_legacy_rescaling    *bool `json:",omitempty"`
	Uses_qcom_bsp_legacy  *bool `json:",omitempty"`
	Uses_qti_camera_device  *bool `json:",omitempty"`
}
