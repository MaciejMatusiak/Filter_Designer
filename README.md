# Filter Designer
Project created by Maciej Matusiak. This application was designed and created as a part of academic programming classes in 2023. The application is based on the  designed Butterworth and FIR filters via the MATLAB environment. In this implementation, they have been designed and presented with the possibility of modification:
- Number of order,
- Type of function that created the filter,
- Type of filter (low-pass, high-pass, band-pass, band-stop),

The input signal that was used for the filtration analysis is a signal composed of three sine waves with frequencies: F1 = 100(Hz);   F2 = 250(Hz);   F3 = 400(Hz). The implemented solution presents the input signal in the form of the frequency spectrum of the signal and the amplitude characteristic of the created filter. In the second graph shown next to it, the frequency characteristics of the signal appear after passing through the filtering system with the parameters set by the user.

# Main characteristics of the Butterworth filter:
- Flat frequency response in the passband
- Monotonic roll-off (smooth transition from passband to stopband)
- Maximally flat magnitude response in the passband
- Infinite cut off rate in the stopband.
- 
# Main characteristics of the FIR filter:
- Fixed impulse response: The output response of an FIR filter to a delta input is finite in duration, hence the name "Finite Impulse Response".
- Linear phase response: The phase response of an FIR filter is linear, meaning it does not distort the phase of signals passing through it.
- Stable: FIR filters are always stable, meaning their impulse response does not grow indefinitely.
- Infinite impulse response (IIR) filters: Unlike IIR filters, FIR filters do not rely on feedback and therefore do not have issues such as ringing or instability.

Sources:
- https://uk.mathworks.com/help/signal/ug/iir-filter-design.html
- https://uk.mathworks.com/help/signal/ug/fir-filter-design.html
- https://www.sciencedirect.com/topics/engineering/fir-filter
- https://www.sciencedirect.com/topics/engineering/iir-filter
