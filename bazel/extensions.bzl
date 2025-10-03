"""Module extensions for FHIR project"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

def _fhir_http_files_impl(ctx):
    http_file(
        name = "hl7.fhir.r4.core_4.0.1",
        downloaded_file_path = "hl7.fhir.r4.core@4.0.1.tgz",
        sha256 = "b090bf929e1f665cf2c91583720849695bc38d2892a7c5037c56cb00817fb091",
        url = "https://hl7.org/fhir/R4/hl7.fhir.r4.core.tgz",
    )
    http_file(
        name = "hl7.fhir.r5.core_5.0.0",
        downloaded_file_path = "hl7.fhir.r5.core@5.0.0.tgz",
        sha256 = "74b27cd1bfce9e80eaceac431edf230b0945a443564fbf5512f82e5fa50a80d4",
        url = "https://hl7.org/fhir/R5/hl7.fhir.r5.core.tgz",
    )

fhir_http_files = module_extension(implementation = _fhir_http_files_impl)


def _fhir_custom_deps_impl(ctx):
    http_archive(
        name = "icu",
        sha256 = "dfc62618aa4bd3ca14a3df548cd65fe393155edd213e49c39f3a30ccd618fc27",
        strip_prefix = "icu-release-64-2",
        build_file = "@com_google_fhir//bazel/buildfiles:icu.BUILD",
        urls = [
            "https://storage.googleapis.com/mirror.tensorflow.org/github.com/unicode-org/icu/archive/release-64-2.zip",
            "https://github.com/unicode-org/icu/archive/release-64-2.zip",
        ],
    )

fhir_custom_deps = module_extension(implementation = _fhir_custom_deps_impl)
