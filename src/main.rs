use std::os::raw::c_char;

extern "C" {
    fn render_crab_c(size: i32, result: *mut c_char);
}

fn main() {
    let size = 5;
    let buffer_size = size * size * size;

    let mut buffer: Vec<u8> = vec![0; buffer_size as usize];

    unsafe {
        render_crab_c(size, buffer.as_mut_ptr() as *mut c_char);
    }

    for z in 0..size {
        println!("Layer {}:", z);
        for y in 0..size {
            for x in 0..size {
                print!(
                    "{}",
                    buffer[(x + y * size + z * size * size) as usize] as char
                );
            }
            println!();
        }
        println!();
    }
}
