fn main() {
    println!("cargo:rustc-link-lib=static=crab");
    println!("cargo:rustc-link-search=native=libcrab.a");
}
